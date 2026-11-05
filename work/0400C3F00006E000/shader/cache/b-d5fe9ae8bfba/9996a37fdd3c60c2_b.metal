#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _40(thread const int& _814, thread const int& _815, constant _10& support_buffer)
{
    int _818 = 1 + _815;
    float _820 = support_buffer._m5[_818].x;
    float _822 = abs(_820);
    bool _824 = _822 == 1.0;
    if (_824)
    {
        return _814;
    }
    float _826 = float(_814);
    float _828 = _826 / _822;
    int _830 = int(_828);
    return _830;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_29.z;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = 1.0 / _44;
    float _54 = _52 * _50;
    bool _58 = _54 != 0.0;
    bool _60 = isnan(_54);
    bool _62 = _58 || _60;
    bool _64 = isnan(0.0);
    bool _66 = _62 || _64;
    bool _68 = !_66;
    if (!_68)
    {
        float _70 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _72 = fma(_54, _70, 1.0);
        float _74 = log2(_72);
        float _76 = _74 + (-1.0);
        float _78 = trunc(_76);
        int _80 = int(_78);
        int _82 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(_80), spvDescriptorSet0.fp_t_tcb_8.get_height(_80)).x;
        int _84 = _82;
        int _86 = 0;
        int _88 = _40(_84, _86, (*spvDescriptorSet0.support_buffer));
        int _90 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(_80), spvDescriptorSet0.fp_t_tcb_8.get_height(_80)).y;
        int _92 = _90;
        int _94 = 0;
        int _96 = _40(_92, _94, (*spvDescriptorSet0.support_buffer));
        float _98 = in.m_31.x;
        float _100 = gl_FragCoord.w;
        float _102 = _98 * _100;
        float _104 = in.m_31.y;
        float _106 = gl_FragCoord.w;
        float _108 = _104 * _106;
        float _110 = _52 * _102;
        float _112 = _52 * _108;
        float _114 = float(_88);
        float _116 = float(_96);
        float _118 = fma(_110, _114, -0.5);
        float _120 = fma(_112, _116, -0.5);
        float _122 = floor(_118);
        float _124 = floor(_120);
        float _126 = -_122;
        float _128 = _118 + _126;
        float _130 = 1.0 / _116;
        float _132 = -_128;
        float _134 = _132 + 1.0;
        float _136 = -_128;
        float _138 = _136 + 2.0;
        float _140 = -_124;
        float _142 = _120 + _140;
        float _144 = _134 * _134;
        float _146 = -_142;
        float _148 = _146 + 1.0;
        float _150 = _134 * _144;
        float _152 = _138 * _138;
        float _154 = -_142;
        float _156 = _154 + 2.0;
        float _158 = _148 * _148;
        float _160 = -_150;
        float _162 = _160 + 6.0;
        float _164 = _156 * _156;
        float _166 = _148 * _158;
        float _168 = _150 * 4.0;
        float _170 = _166 * 4.0;
        float _172 = -_168;
        float _174 = fma(_138, _152, _172);
        float _176 = _142 * _142;
        float _178 = -_170;
        float _180 = fma(_156, _164, _178);
        float _182 = -_174;
        float _184 = _182 + _162;
        float _186 = -_166;
        float _188 = _186 + 6.0;
        float _190 = _150 + _174;
        float _192 = _142 * _176;
        float _194 = _184 * 0.16666667163372039794921875;
        float _196 = _166 + _180;
        float _198 = -_180;
        float _200 = _198 + _188;
        float _202 = _190 * 0.16666667163372039794921875;
        float _204 = 1.0 / _194;
        float _206 = _196 * 0.16666667163372039794921875;
        float _208 = _200 * 0.16666667163372039794921875;
        float _210 = _128 * _128;
        float _212 = _180 * 0.16666667163372039794921875;
        float _214 = _122 + (-0.5);
        float _216 = _174 * 0.16666667163372039794921875;
        float _218 = _128 * _210;
        float _220 = 1.0 / _206;
        float _222 = _124 + (-0.5);
        float _224 = _122 + 1.5;
        float _226 = _124 + 1.5;
        float _228 = _218 * 0.16666667163372039794921875;
        float _230 = _192 * 0.16666667163372039794921875;
        float _232 = 1.0 / _202;
        float _234 = fma(_228, _204, _224);
        float _236 = 1.0 / _208;
        float _238 = fma(_212, _220, _222);
        float _240 = _238 * _130;
        float _242 = 1.0 / _114;
        float _244 = fma(_230, _236, _226);
        float _246 = fma(_216, _232, _214);
        float _248 = _244 * _130;
        float _250 = _246 * _242;
        float _252 = _234 * _242;
        float2 _636 = float2(_250, _240);
        float3 _256 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_636, float2(0.0), isnan(_636)), level(_76)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_636, float2(0.0), isnan(_636)), level(_76)).xyz;
        float _258 = _256.x;
        float _260 = _256.y;
        float _262 = _256.z;
        float2 _653 = float2(_252, _240);
        float3 _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_653, float2(0.0), isnan(_653)), level(_76)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_653, float2(0.0), isnan(_653)), level(_76)).xyz;
        float _266 = _264.x;
        float _268 = _264.y;
        float _270 = _264.z;
        float2 _668 = float2(_250, _248);
        float3 _272 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_668, float2(0.0), isnan(_668)), level(_76)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_668, float2(0.0), isnan(_668)), level(_76)).xyz;
        float _274 = _272.x;
        float _276 = _272.y;
        float _278 = _272.z;
        float2 _683 = float2(_252, _248);
        float3 _280 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_683, float2(0.0), isnan(_683)), level(_76)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_683, float2(0.0), isnan(_683)), level(_76)).xyz;
        float _282 = _280.x;
        float _284 = _280.y;
        float _286 = _280.z;
        float _288 = in.m_29.x;
        float _290 = gl_FragCoord.w;
        float _292 = _288 * _290;
        float _294 = in.m_29.y;
        float _296 = gl_FragCoord.w;
        float _298 = _294 * _296;
        float _300 = 0.0 + _74;
        float _302 = precise::clamp(_300, 0.0, 1.0);
        float _304 = _52 * _292;
        float _306 = _52 * _298;
        float _308 = fma(_306, _302, _304);
        float _310 = -_266;
        float _312 = _258 + _310;
        float _314 = -_270;
        float _316 = _262 + _314;
        float _318 = -_268;
        float _320 = _260 + _318;
        float _322 = fma(_202, _312, _266);
        float _324 = -_282;
        float _326 = _274 + _324;
        float _328 = -_284;
        float _330 = _276 + _328;
        float _332 = -_286;
        float _334 = _278 + _332;
        float _336 = fma(_202, _316, _270);
        float _338 = fma(_202, _326, _282);
        float _340 = fma(_202, _320, _268);
        float _342 = fma(_202, _330, _284);
        float _344 = fma(_202, _334, _286);
        float _346 = -_338;
        float _348 = _346 + _322;
        float _350 = -_342;
        float _352 = _350 + _340;
        float _354 = -_344;
        float _356 = _354 + _336;
        float _358 = fma(_206, _348, _338);
        float _360 = fma(_206, _352, _342);
        float _362 = fma(_206, _356, _344);
        out.m_34.x = _358;
        out.m_34.y = _360;
        out.m_34.z = _362;
        out.m_34.w = _308;
        return out;
    }
    discard_fragment();
    return out;
}

