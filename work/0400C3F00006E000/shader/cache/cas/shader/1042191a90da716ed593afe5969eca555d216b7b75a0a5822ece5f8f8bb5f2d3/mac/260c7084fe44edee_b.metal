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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_46 [[user(locn5)]];
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
    float2 _364 = float2(_69, _71);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_364, float2(0.0), isnan(_364))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_364, float2(0.0), isnan(_364))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_35.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_37.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = _67 * _88;
    float _98 = _67 * _94;
    float _100 = in.m_39.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = _82 * _96;
    float _108 = 0.0 + _106;
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = _110 * _98;
    bool _116 = _112 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _118 = isnan(_112);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _124 = _120 || _122;
    float _126 = in.m_39.y;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    if (!_124)
    {
        discard_fragment();
    }
    float _132 = _67 * _104;
    float _134 = _67 * _130;
    float2 _456 = float2(_132, _134);
    float3 _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_456, float2(0.0), isnan(_456))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_456, float2(0.0), isnan(_456))).xyz;
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = _138.z;
    float _146 = in.m_41.x;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_41.y;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_41.z;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_35.x;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_35.y;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_35.z;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = _76 * _76;
    float _184 = _78 * _78;
    float _186 = _80 * _80;
    float _188 = _67 * _156;
    float _190 = _67 * _162;
    float _192 = _182 * _140;
    float _194 = _184 * _142;
    float _196 = _186 * _144;
    float _198 = _67 * _150;
    float _200 = -_192;
    float _202 = _200 + 1.0;
    float _204 = -_194;
    float _206 = _204 + 1.0;
    float _208 = -_196;
    float _210 = _208 + 1.0;
    float _212 = _198 * _202;
    float _214 = _188 * _206;
    float _216 = 0.0 + (*spvDescriptorSet0.fp_c7)._m0[0].x;
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = _190 * _210;
    float _222 = _67 * _168;
    float _224 = _67 * _174;
    float _226 = _67 * _180;
    float _228 = fma(_218, -0.5, 1.0);
    float _230 = fma(_192, _222, _212);
    float _232 = fma(_194, _224, _214);
    float _234 = fma(_196, _226, _220);
    float _236 = _230 * _228;
    float _238 = _232 * _228;
    float _240 = _234 * _228;
    if (!_124)
    {
        out.m_44.x = _236;
        out.m_44.y = _238;
        out.m_44.z = _240;
        out.m_44.w = _106;
        return out;
    }
    float _242 = in.m_46.w;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = _67 * _246;
    bool _250 = _248 != 1.0;
    bool _252 = isnan(_248);
    bool _254 = _250 || _252;
    bool _256 = isnan(1.0);
    bool _258 = _254 || _256;
    bool _260 = !_258;
    if (!_260)
    {
        float _262 = gl_FragCoord.x;
        float _264 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _266 = _262 / _264;
        float _268 = gl_FragCoord.y;
        float _270 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _272 = _268 / _270;
        float _274 = _248 * 256.0;
        float _276 = trunc(_274);
        int _279 = int(_276);
        float _281 = trunc(_266);
        int _283 = int(_281);
        float _285 = trunc(_272);
        int _287 = int(_285);
        int _289 = _283 + 2;
        int _291 = _289 >> 1;
        uint _294 = uint(int(uint(_287) >> uint(1)));
        int _296 = _291 ^ int(_294);
        int _298 = _296 << 16;
        int _300 = _298 ^ _291;
        int _302 = 983055 & _300;
        int _304 = _302 << 6;
        int _306 = _304 + _302;
        int _308 = _306 & 13369548;
        uint _310 = uint(int(uint(_308) >> uint(3)));
        int _312 = _308 | int(_310);
        uint _314 = uint(int(uint(_279) >> uint(7)));
        int _316 = int(_314) + _279;
        int _318 = _312 & 5570560;
        int _320 = _312 & 85;
        uint _322 = uint(int(uint(_318) >> uint(15)));
        int _324 = int(_322) + _320;
        bool _326 = uint(_316) > uint(_324);
        if (!_326)
        {
            discard_fragment();
        }
        if (!_326)
        {
            out.m_44.x = _236;
            out.m_44.y = _238;
            out.m_44.z = _240;
            out.m_44.w = _112;
            return out;
        }
    }
    float _328 = 0.0 + _112;
    float _330 = precise::clamp(_328, 0.0, 1.0);
    out.m_44.x = 1.0;
    out.m_44.y = 1.0;
    out.m_44.z = 1.0;
    out.m_44.w = _330;
    return out;
}

