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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _955, thread const int& _956, constant _10& support_buffer)
{
    int _959 = 1 + _956;
    float _961 = support_buffer._m5[_959].x;
    float _963 = abs(_961);
    bool _965 = _963 == 1.0;
    if (_965)
    {
        return _955;
    }
    float _967 = float(_955);
    float _969 = _967 / _963;
    int _971 = int(_969);
    return _971;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_31.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_31.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _440 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_440, float2(0.0), isnan(_440))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_440, float2(0.0), isnan(_440))).x;
    bool _70 = _66 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_70)
    {
        discard_fragment();
    }
    if (_70)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _72 = in.m_36.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_36.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_36.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _92 = precise::clamp(_90, 0.0, 1.0);
    float _94 = _60 * _76;
    float _96 = _60 * _82;
    float _98 = _60 * _88;
    float _100 = precise::max(_92, _94);
    bool _102 = _100 != 0.0;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan(0.0);
    bool _110 = _106 || _108;
    bool _112 = !_110;
    if (!_112)
    {
        float _114 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _116 = fma(_100, _114, 1.0);
        float _118 = log2(_116);
        float _120 = _118 + (-1.0);
        float _122 = trunc(_120);
        int _124 = int(_122);
        int _126 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_124), spvDescriptorSet0.fp_t_tcb_A.get_height(_124)).x;
        int _128 = _126;
        int _130 = 1;
        int _132 = _42(_128, _130, (*spvDescriptorSet0.support_buffer));
        int _134 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_124), spvDescriptorSet0.fp_t_tcb_A.get_height(_124)).y;
        int _136 = _134;
        int _138 = 1;
        int _140 = _42(_136, _138, (*spvDescriptorSet0.support_buffer));
        float _142 = float(_132);
        float _144 = float(_140);
        float _146 = fma(_62, _142, -0.5);
        float _148 = fma(_64, _144, -0.5);
        float _150 = 1.0 / _142;
        float _152 = floor(_146);
        float _154 = floor(_148);
        float _156 = -_152;
        float _158 = _146 + _156;
        float _160 = -_158;
        float _162 = _160 + 1.0;
        float _164 = -_158;
        float _166 = _164 + 2.0;
        float _168 = -_154;
        float _170 = _148 + _168;
        float _172 = _162 * _162;
        float _174 = -_170;
        float _176 = _174 + 1.0;
        float _178 = _162 * _172;
        float _180 = -_170;
        float _182 = _180 + 2.0;
        float _184 = _166 * _166;
        float _186 = _176 * _176;
        float _188 = _178 * 4.0;
        float _190 = -_178;
        float _192 = _190 + 6.0;
        float _194 = _176 * _186;
        float _196 = _182 * _182;
        float _198 = -_188;
        float _200 = fma(_166, _184, _198);
        float _202 = _194 * 4.0;
        float _204 = 1.0 / _144;
        float _206 = -_200;
        float _208 = _206 + _192;
        float _210 = -_202;
        float _212 = fma(_182, _196, _210);
        float _214 = -_194;
        float _216 = _214 + 6.0;
        float _218 = _208 * 0.16666667163372039794921875;
        float _220 = _178 + _200;
        float _222 = _158 * _158;
        float _224 = -_212;
        float _226 = _224 + _216;
        float _228 = _170 * _170;
        float _230 = _220 * 0.16666667163372039794921875;
        float _232 = 1.0 / _218;
        float _234 = _226 * 0.16666667163372039794921875;
        float _236 = _194 + _212;
        float _238 = _158 * _222;
        float _240 = _170 * _228;
        float _242 = _154 + (-0.5);
        float _244 = _236 * 0.16666667163372039794921875;
        float _246 = _212 * 0.16666667163372039794921875;
        float _248 = 1.0 / _234;
        float _250 = _152 + (-0.5);
        float _252 = _152 + 1.5;
        float _254 = _154 + 1.5;
        float _256 = _238 * 0.16666667163372039794921875;
        float _258 = _240 * 0.16666667163372039794921875;
        float _260 = _200 * 0.16666667163372039794921875;
        float _262 = 1.0 / _244;
        float _264 = fma(_256, _232, _252);
        float _266 = _264 * _150;
        float _268 = 1.0 / _230;
        float _270 = fma(_258, _248, _254);
        float _272 = _270 * _204;
        float _274 = fma(_246, _262, _242);
        float _276 = _274 * _204;
        float _278 = fma(_260, _268, _250);
        float _280 = _278 * _150;
        float2 _738 = float2(_280, _276);
        float3 _284 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_738, float2(0.0), isnan(_738)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_738, float2(0.0), isnan(_738)), level(_120)).xyz;
        float _286 = _284.x;
        float _288 = _284.y;
        float _290 = _284.z;
        float2 _753 = float2(_266, _276);
        float3 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_753, float2(0.0), isnan(_753)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_753, float2(0.0), isnan(_753)), level(_120)).xyz;
        float _294 = _292.x;
        float _296 = _292.y;
        float _298 = _292.z;
        float2 _768 = float2(_280, _272);
        float3 _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_768, float2(0.0), isnan(_768)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_768, float2(0.0), isnan(_768)), level(_120)).xyz;
        float _302 = _300.x;
        float _304 = _300.y;
        float _306 = _300.z;
        float2 _783 = float2(_266, _272);
        float3 _308 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_783, float2(0.0), isnan(_783)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_783, float2(0.0), isnan(_783)), level(_120)).xyz;
        float _310 = _308.x;
        float _312 = _308.y;
        float _314 = _308.z;
        float _316 = -_294;
        float _318 = _286 + _316;
        float _320 = -_296;
        float _322 = _288 + _320;
        float _324 = -_310;
        float _326 = _302 + _324;
        float _328 = -_298;
        float _330 = _290 + _328;
        float _332 = -_312;
        float _334 = _304 + _332;
        float _336 = -_314;
        float _338 = _306 + _336;
        float _340 = 0.0 + _118;
        float _342 = precise::clamp(_340, 0.0, 1.0);
        float _344 = fma(_230, _318, _294);
        float _346 = fma(_230, _322, _296);
        float _348 = fma(_230, _330, _298);
        float _350 = fma(_230, _326, _310);
        float _352 = fma(_230, _334, _312);
        float _354 = fma(_230, _338, _314);
        float _356 = fma(_98, _342, _96);
        float _358 = -_350;
        float _360 = _358 + _344;
        float _362 = -_352;
        float _364 = _362 + _346;
        float _366 = -_354;
        float _368 = _366 + _348;
        float _370 = 1.0 / _356;
        float _372 = fma(_244, _360, _350);
        float _374 = fma(_244, _364, _352);
        float _376 = fma(_244, _368, _354);
        float _378 = _342 * _372;
        float _380 = _342 * _374;
        float _382 = _342 * _376;
        float _384 = -_378;
        float _386 = _384 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _388 = -_380;
        float _390 = _388 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _392 = -_382;
        float _394 = _392 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _396 = fma(_96, _386, _378);
        float _398 = fma(_96, _390, _380);
        float _400 = fma(_96, _394, _382);
        float _402 = _396 * _370;
        float _404 = _398 * _370;
        float _406 = _400 * _370;
        out.m_34.x = _402;
        out.m_34.y = _404;
        out.m_34.z = _406;
        out.m_34.w = _356;
        return out;
    }
    out.m_34.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_34.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_34.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_34.w = _96;
    return out;
}

