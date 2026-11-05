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
    float2 _397 = float2(_83, _85);
    float4 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_397, float2(0.0), isnan(_397))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_397, float2(0.0), isnan(_397))).xyzw;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float _100 = _92.w;
    float2 _416 = float2(_87, _89);
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_416, float2(0.0), isnan(_416))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_416, float2(0.0), isnan(_416))).xyzw;
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
    float _136 = in.m_37.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_39.x;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_39.y;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_39.z;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = _81 * _140;
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
    float _192 = in.m_37.z;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    if (!_184)
    {
        discard_fragment();
    }
    float _198 = _94 * _104;
    float _200 = _96 * _106;
    float _202 = _81 * _146;
    float _204 = _81 * _152;
    float _206 = _81 * _158;
    float _208 = _98 * _108;
    float _210 = -_202;
    float _212 = _160 + _210;
    float _214 = fma(_198, _212, _202);
    float _216 = _81 * _190;
    float _218 = _81 * _196;
    float _220 = -_204;
    float _222 = _216 + _220;
    float _224 = -_206;
    float _226 = _218 + _224;
    float _228 = fma(_200, _222, _204);
    float _230 = fma(_208, _226, _206);
    if (!_184)
    {
        out.m_44.x = _214;
        out.m_44.y = _228;
        out.m_44.z = _230;
        out.m_44.w = _166;
        return out;
    }
    float _232 = _228 * 0.715200006961822509765625;
    float _234 = in.m_46.w;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = in.m_46.z;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = in.m_46.x;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = fma(_214, 0.2125999927520751953125, _232);
    float _254 = in.m_46.y;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = fma(_230, 0.072200000286102294921875, _252);
    bool _262 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _264 = 1.0 / _260;
    float _266 = _264 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = fma(_268, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _272 = _81 * _238;
    float _274 = 0.0 + _172;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = _81 * _244;
    float _280 = _81 * _258;
    float _282 = _270 * _272;
    float _284 = _81 * _250;
    float _286 = fma(_230, _282, _278);
    float _288 = fma(_214, _282, _284);
    float _290 = fma(_228, _282, _280);
    float _292 = _278;
    if (!_262)
    {
        _292 = _276;
    }
    float _294 = _292;
    bool _296 = !_262;
    float _298 = _294;
    if (!_296)
    {
        float _300 = in.m_48.w;
        float _302 = gl_FragCoord.w;
        float _304 = _300 * _302;
        float _306 = in.m_48.z;
        float _308 = gl_FragCoord.w;
        float _310 = _306 * _308;
        float _312 = _81 * _304;
        float _314 = _81 * _310;
        float _316 = 1.0 / _312;
        float _318 = _314 * _316;
        float _320 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _322 = fma(_318, (*spvDescriptorSet0.fp_c8)._m0[30].w, _320);
        float _324 = 1.0 / _322;
        float _326 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _328 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _330 = fma(_324, _326, _328);
        float _332 = _330 * 8.0;
        float _334 = precise::clamp(_332, 0.0, 1.0);
        float _336 = _276 * _334;
        _298 = _336;
    }
    float _338 = _298;
    float _340 = 0.0 + _338;
    float _342 = precise::clamp(_340, 0.0, 1.0);
    out.m_44.x = _288;
    out.m_44.y = _290;
    out.m_44.z = _286;
    out.m_44.w = _342;
    return out;
}

