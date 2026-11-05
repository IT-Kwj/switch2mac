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
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_48 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 m_46 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_33.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _374 = float2(_71, _73);
    float4 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_374, float2(0.0), isnan(_374))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_374, float2(0.0), isnan(_374))).xyzw;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = _76.z;
    float _84 = _76.w;
    float _86 = in.m_35.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_37.w;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_39.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_41.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = _69 * _90;
    float _112 = _110 * _110;
    float _114 = _112 * _112;
    float _116 = _114 * 0.25;
    float _118 = _69 * _102;
    float _120 = in.m_39.z;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_37.x;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_37.y;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_37.z;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = fma(_84, _110, _116);
    float _146 = _69 * _96;
    float _148 = -_146;
    float _150 = _148 + _144;
    float _152 = _118 * _150;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = _69 * _108;
    float _158 = _154 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _160 = precise::clamp(_158, 0.0, 1.0);
    float _162 = _160 * _156;
    bool _166 = _162 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _168 = isnan(_162);
    bool _170 = _166 || _168;
    bool _172 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _174 = _170 || _172;
    float _176 = in.m_39.x;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_39.y;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    if (!_174)
    {
        discard_fragment();
    }
    float _188 = _78 * _78;
    float _190 = _82 * _82;
    float _192 = _69 * _124;
    float _194 = -_190;
    float _196 = _194 + 1.0;
    float _198 = _192 * _196;
    float _200 = _69 * _136;
    float _202 = _69 * _180;
    float _204 = _80 * _80;
    float _206 = _69 * _186;
    float _208 = -_188;
    float _210 = _208 + 1.0;
    float _212 = -_204;
    float _214 = _212 + 1.0;
    float _216 = _202 * _210;
    float _218 = _69 * _130;
    float _220 = _206 * _214;
    float _222 = _69 * _142;
    float _224 = fma(_188, _218, _216);
    float _226 = fma(_204, _200, _220);
    float _228 = fma(_190, _222, _198);
    if (!_174)
    {
        out.m_44.x = _224;
        out.m_44.y = _226;
        out.m_44.z = _228;
        out.m_44.w = _160;
        return out;
    }
    float _230 = _226 * 0.715200006961822509765625;
    float _232 = in.m_46.w;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_46.z;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_46.x;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = fma(_224, 0.2125999927520751953125, _230);
    float _252 = in.m_46.y;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = fma(_228, 0.072200000286102294921875, _250);
    bool _260 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _262 = 1.0 / _258;
    float _264 = _262 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = _69 * _236;
    float _270 = fma(_266, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _272 = _69 * _242;
    float _274 = _270 * _268;
    float _276 = 0.0 + _162;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = _69 * _248;
    float _282 = _69 * _256;
    float _284 = fma(_228, _274, _272);
    float _286 = fma(_224, _274, _280);
    float _288 = fma(_226, _274, _282);
    float _290 = _272;
    if (!_260)
    {
        _290 = _278;
    }
    float _292 = _290;
    bool _294 = !_260;
    float _296 = _292;
    if (!_294)
    {
        float _298 = in.m_48.w;
        float _300 = gl_FragCoord.w;
        float _302 = _298 * _300;
        float _304 = in.m_48.z;
        float _306 = gl_FragCoord.w;
        float _308 = _304 * _306;
        float _310 = _69 * _302;
        float _312 = _69 * _308;
        float _314 = 1.0 / _310;
        float _316 = _312 * _314;
        float _318 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _320 = fma(_316, (*spvDescriptorSet0.fp_c8)._m0[30].w, _318);
        float _322 = 1.0 / _320;
        float _324 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _326 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _328 = fma(_322, _324, _326);
        float _330 = _328 * 8.0;
        float _332 = precise::clamp(_330, 0.0, 1.0);
        float _334 = _278 * _332;
        _296 = _334;
    }
    float _336 = _296;
    float _338 = 0.0 + _336;
    float _340 = precise::clamp(_338, 0.0, 1.0);
    out.m_44.x = _286;
    out.m_44.y = _288;
    out.m_44.z = _284;
    out.m_44.w = _340;
    return out;
}

