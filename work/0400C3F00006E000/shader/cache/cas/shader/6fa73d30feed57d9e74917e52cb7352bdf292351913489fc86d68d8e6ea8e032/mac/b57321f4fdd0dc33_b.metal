#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
};

struct main0_out
{
    float4 m_25 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _32 = gl_FragCoord.y;
    float _34 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _36 = _32 / _34;
    float _38 = gl_FragCoord.x;
    float _40 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _42 = _38 / _40;
    float _44 = (*spvDescriptorSet0.fp_c3)._m0[0].y * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _46 = fma((*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[0].x, _44);
    float _48 = sqrt(_46);
    float _50 = rsqrt(_46);
    float _52 = precise::max(_48, 9.9999999392252902907785028219223e-09);
    float _54 = 1.0 / _52;
    float _56 = _36 + (-0.5);
    float _58 = _54 * 0.855000019073486328125;
    float _60 = _58 * _58;
    float _62 = _60 * 9.81000041961669921875;
    float _64 = (*spvDescriptorSet0.fp_c3)._m0[0].z * 0.5;
    float _66 = _42 + (-0.5);
    float _68 = precise::max(_62, 9.9999999392252902907785028219223e-09);
    bool _72 = _56 >= _64;
    bool _74 = isnan(_56);
    bool _76 = _72 || _74;
    bool _78 = isnan(_64);
    bool _80 = _76 || _78;
    bool _82 = _66 >= _64;
    bool _84 = isnan(_66);
    bool _86 = _82 || _84;
    bool _88 = isnan(_64);
    bool _90 = _86 || _88;
    float _92 = _68 * 9.81000041961669921875;
    float _94 = _68 * _68;
    float _96 = 1.0 / _68;
    float _98 = _92 * _94;
    float _100 = fma(_98, 7.3046016950684133917093276977539e-06, _92);
    float _102 = (*spvDescriptorSet0.fp_c3)._m0[0].w * 6.283185482025146484375;
    float _104 = _56;
    float _106 = _66;
    if (_80)
    {
        float _108 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _110 = _56 + _108;
        _104 = _110;
    }
    float _112 = _104;
    if (_90)
    {
        float _114 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _116 = _66 + _114;
        _106 = _116;
    }
    float _118 = _106;
    float _120 = sqrt(_100);
    float _122 = _112 * _102;
    float _124 = _118 * _102;
    float _126 = _122 * _122;
    float _128 = fma(_124, _124, _126);
    float _130 = sqrt(_128);
    float _132 = _120 * _96;
    float _134 = 1.0 / _132;
    float _136 = precise::max(_130, 9.9999999392252902907785028219223e-09);
    float _138 = rsqrt(_128);
    float _140 = _132 * 0.002773986198008060455322265625;
    float _142 = _136 * 9.81000041961669921875;
    float _144 = _136 * _136;
    float _146 = _136 * _96;
    float _148 = _52 * _134;
    float _150 = 1.0 / _136;
    float _152 = _142 * _144;
    float _154 = fma(_152, 7.3046016950684133917093276977539e-06, _142);
    float _156 = _52 * _52;
    float _158 = fma(_136, 0.002702702768146991729736328125, -1.0);
    float _160 = abs(_148);
    float _162 = log2(_160);
    float _164 = _52 * 0.4099999964237213134765625;
    float _166 = _158 * _158;
    float _168 = _166 * (-0.3606737554073333740234375);
    float _170 = sqrt(_154);
    float _172 = _68 * _150;
    float _174 = _172 * _172;
    float _176 = _162 * 0.89999997615814208984375;
    float _178 = _156 * 3.7716615679528331384062767028809e-06;
    float _180 = sqrt(_146);
    float _182 = _174 * (-1.44269502162933349609375);
    float _184 = _170 * _150;
    float _186 = exp2(_176);
    float _188 = _184 * _134;
    float _190 = 1.0 / _184;
    float _192 = _178 * _186;
    float _194 = abs(_188);
    float _196 = log2(_194);
    float _198 = _190 * 0.23000000417232513427734375;
    float _200 = 1.0 / _192;
    float _202 = _140 * _190;
    float _204 = abs(_198);
    float _206 = log2(_204);
    float _208 = _196 * 2.5;
    float _210 = _200 * 10.0;
    float _212 = abs(_136);
    float _214 = log2(_212);
    float _216 = log2(_210);
    float _218 = _206 * 2.5;
    float _220 = exp2(_208);
    float _222 = _216 * 0.693147182464599609375;
    float _224 = exp2(_218);
    float _226 = _180 + (-1.0);
    float _228 = _226 * _226;
    float _230 = 1.0 / _222;
    float _232 = fma(_220, 4.0, 0.17328679561614990234375);
    float _234 = _228 * (-0.2527878582477569580078125);
    float _236 = exp2(_234);
    float _238 = fma(_180, -0.3900682926177978515625, 0.3900682926177978515625);
    float _240 = _164 * _230;
    float _242 = exp2(_168);
    float _244 = _122 * _138;
    float _246 = _124 * _138;
    float _248 = _240 * 0.56521737575531005859375;
    float _250 = _240 * 4.3478260040283203125;
    bool _252 = _240 >= 0.23000000417232513427734375;
    bool _254 = isnan(_240);
    bool _256 = _252 || _254;
    bool _258 = isnan(0.23000000417232513427734375);
    bool _260 = _256 || _258;
    float _262 = fma(_248, _224, _232);
    float _264 = _236 * 0.76553475856781005859375;
    float _266 = log2(_250);
    float _268 = _262 * (-2.8853900432586669921875);
    bool _270 = !_260;
    float _272 = _270 ? 0.693147182464599609375 : 2.079441547393798828125;
    float _274 = _50 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _276 = _124 != 0.0;
    bool _278 = isnan(_124);
    bool _280 = _276 || _278;
    bool _282 = isnan(0.0);
    bool _284 = _280 || _282;
    float _286 = _274 * _244;
    float _288 = exp2(_268);
    bool _290 = _122 == 0.0;
    bool _292 = !_284;
    bool _294 = _290 && _292;
    float _296 = exp2(_182);
    float _298 = _266 * _272;
    float _300 = fma(_298, 0.001150000025518238544464111328125, 0.001150000025518238544464111328125);
    float _302 = exp2(_264);
    float _304 = spvFAdd(_288, 1.0);
    float _306 = -_288;
    float _308 = _306 + 1.0;
    float _310 = exp2(_238);
    float _312 = 1.0 / _304;
    float _314 = _214 * (-4.0);
    float _316 = _50 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _318 = _300 * _190;
    float _320 = _296 * _302;
    float _322 = fma(_316, _246, _286);
    float _324 = _242 * _318;
    float _326 = exp2(_314);
    float _328 = _320 * _310;
    float _330 = _322 * _322;
    float _332 = _296 * _324;
    float _334 = fma(_330, 2.0, -1.0);
    float _336 = fma(_328, _202, _332);
    float _338 = _308 * _312;
    float _340 = fma(_338, _334, 1.0);
    float _342 = _326 * 0.15915493667125701904296875;
    float _344 = _342 * _336;
    float _346 = _344 * _340;
    float _348 = _346 * 0.5;
    float _350 = sqrt(_348);
    float _352 = _102 * _350;
    bool _354 = !_294;
    int _357 = _354 ? as_type<int>(_352) : 0;
    out.m_25.x = as_type<float>(_357);
    out.m_25.y = 0.0;
    out.m_25.z = 0.0;
    out.m_25.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_25 [[color(0)]];
};

fragment main0_out_u main0_u(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _32 = gl_FragCoord.y;
    float _34 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _36 = _32 / _34;
    float _38 = gl_FragCoord.x;
    float _40 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _42 = _38 / _40;
    float _44 = (*spvDescriptorSet0.fp_c3)._m0[0].y * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _46 = fma((*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[0].x, _44);
    float _48 = sqrt(_46);
    float _50 = rsqrt(_46);
    float _52 = precise::max(_48, 9.9999999392252902907785028219223e-09);
    float _54 = 1.0 / _52;
    float _56 = _36 + (-0.5);
    float _58 = _54 * 0.855000019073486328125;
    float _60 = _58 * _58;
    float _62 = _60 * 9.81000041961669921875;
    float _64 = (*spvDescriptorSet0.fp_c3)._m0[0].z * 0.5;
    float _66 = _42 + (-0.5);
    float _68 = precise::max(_62, 9.9999999392252902907785028219223e-09);
    bool _72 = _56 >= _64;
    bool _74 = isnan(_56);
    bool _76 = _72 || _74;
    bool _78 = isnan(_64);
    bool _80 = _76 || _78;
    bool _82 = _66 >= _64;
    bool _84 = isnan(_66);
    bool _86 = _82 || _84;
    bool _88 = isnan(_64);
    bool _90 = _86 || _88;
    float _92 = _68 * 9.81000041961669921875;
    float _94 = _68 * _68;
    float _96 = 1.0 / _68;
    float _98 = _92 * _94;
    float _100 = fma(_98, 7.3046016950684133917093276977539e-06, _92);
    float _102 = (*spvDescriptorSet0.fp_c3)._m0[0].w * 6.283185482025146484375;
    float _104 = _56;
    float _106 = _66;
    if (_80)
    {
        float _108 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _110 = _56 + _108;
        _104 = _110;
    }
    float _112 = _104;
    if (_90)
    {
        float _114 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _116 = _66 + _114;
        _106 = _116;
    }
    float _118 = _106;
    float _120 = sqrt(_100);
    float _122 = _112 * _102;
    float _124 = _118 * _102;
    float _126 = _122 * _122;
    float _128 = fma(_124, _124, _126);
    float _130 = sqrt(_128);
    float _132 = _120 * _96;
    float _134 = 1.0 / _132;
    float _136 = precise::max(_130, 9.9999999392252902907785028219223e-09);
    float _138 = rsqrt(_128);
    float _140 = _132 * 0.002773986198008060455322265625;
    float _142 = _136 * 9.81000041961669921875;
    float _144 = _136 * _136;
    float _146 = _136 * _96;
    float _148 = _52 * _134;
    float _150 = 1.0 / _136;
    float _152 = _142 * _144;
    float _154 = fma(_152, 7.3046016950684133917093276977539e-06, _142);
    float _156 = _52 * _52;
    float _158 = fma(_136, 0.002702702768146991729736328125, -1.0);
    float _160 = abs(_148);
    float _162 = log2(_160);
    float _164 = _52 * 0.4099999964237213134765625;
    float _166 = _158 * _158;
    float _168 = _166 * (-0.3606737554073333740234375);
    float _170 = sqrt(_154);
    float _172 = _68 * _150;
    float _174 = _172 * _172;
    float _176 = _162 * 0.89999997615814208984375;
    float _178 = _156 * 3.7716615679528331384062767028809e-06;
    float _180 = sqrt(_146);
    float _182 = _174 * (-1.44269502162933349609375);
    float _184 = _170 * _150;
    float _186 = exp2(_176);
    float _188 = _184 * _134;
    float _190 = 1.0 / _184;
    float _192 = _178 * _186;
    float _194 = abs(_188);
    float _196 = log2(_194);
    float _198 = _190 * 0.23000000417232513427734375;
    float _200 = 1.0 / _192;
    float _202 = _140 * _190;
    float _204 = abs(_198);
    float _206 = log2(_204);
    float _208 = _196 * 2.5;
    float _210 = _200 * 10.0;
    float _212 = abs(_136);
    float _214 = log2(_212);
    float _216 = log2(_210);
    float _218 = _206 * 2.5;
    float _220 = exp2(_208);
    float _222 = _216 * 0.693147182464599609375;
    float _224 = exp2(_218);
    float _226 = _180 + (-1.0);
    float _228 = _226 * _226;
    float _230 = 1.0 / _222;
    float _232 = fma(_220, 4.0, 0.17328679561614990234375);
    float _234 = _228 * (-0.2527878582477569580078125);
    float _236 = exp2(_234);
    float _238 = fma(_180, -0.3900682926177978515625, 0.3900682926177978515625);
    float _240 = _164 * _230;
    float _242 = exp2(_168);
    float _244 = _122 * _138;
    float _246 = _124 * _138;
    float _248 = _240 * 0.56521737575531005859375;
    float _250 = _240 * 4.3478260040283203125;
    bool _252 = _240 >= 0.23000000417232513427734375;
    bool _254 = isnan(_240);
    bool _256 = _252 || _254;
    bool _258 = isnan(0.23000000417232513427734375);
    bool _260 = _256 || _258;
    float _262 = fma(_248, _224, _232);
    float _264 = _236 * 0.76553475856781005859375;
    float _266 = log2(_250);
    float _268 = _262 * (-2.8853900432586669921875);
    bool _270 = !_260;
    float _272 = _270 ? 0.693147182464599609375 : 2.079441547393798828125;
    float _274 = _50 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _276 = _124 != 0.0;
    bool _278 = isnan(_124);
    bool _280 = _276 || _278;
    bool _282 = isnan(0.0);
    bool _284 = _280 || _282;
    float _286 = _274 * _244;
    float _288 = exp2(_268);
    bool _290 = _122 == 0.0;
    bool _292 = !_284;
    bool _294 = _290 && _292;
    float _296 = exp2(_182);
    float _298 = _266 * _272;
    float _300 = fma(_298, 0.001150000025518238544464111328125, 0.001150000025518238544464111328125);
    float _302 = exp2(_264);
    float _304 = spvFAdd(_288, 1.0);
    float _306 = -_288;
    float _308 = _306 + 1.0;
    float _310 = exp2(_238);
    float _312 = 1.0 / _304;
    float _314 = _214 * (-4.0);
    float _316 = _50 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _318 = _300 * _190;
    float _320 = _296 * _302;
    float _322 = fma(_316, _246, _286);
    float _324 = _242 * _318;
    float _326 = exp2(_314);
    float _328 = _320 * _310;
    float _330 = _322 * _322;
    float _332 = _296 * _324;
    float _334 = fma(_330, 2.0, -1.0);
    float _336 = fma(_328, _202, _332);
    float _338 = _308 * _312;
    float _340 = fma(_338, _334, 1.0);
    float _342 = _326 * 0.15915493667125701904296875;
    float _344 = _342 * _336;
    float _346 = _344 * _340;
    float _348 = _346 * 0.5;
    float _350 = sqrt(_348);
    float _352 = _102 * _350;
    bool _354 = !_294;
    int _357 = _354 ? as_type<int>(_352) : 0;
    out.m_25.x = as_type<float>(_357);
    out.m_25.y = 0.0;
    out.m_25.z = 0.0;
    out.m_25.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_25)};
}

